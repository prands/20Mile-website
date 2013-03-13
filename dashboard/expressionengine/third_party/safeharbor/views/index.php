<script type="text/javascript">
$(document).ready(function() {

	var modal_box = $('<div />').dialog({
		autoOpen:false,
		modal:true,
		title:'Download',
		width:500
	});
	//download the backup
	$('.link-download').click(function(event) {
		event.preventDefault();

		// feedback to user through cursor change
		$('body').css('cursor', 'wait');

		var backup_id = this.href.match(/ID=([0-9]+)/)[1];
		var request_url = "<?php echo html_entity_decode(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=retrieve'.AMP.'ID='); ?>" + backup_id;

		// get download page
		$.get(request_url, function( data ) {

			// feedback to user through cursor change
			$('body').css('cursor', 'default');

			// load modal box
			modal_box.html(data);
			modal_box.dialog( "open" );
		});
	});

	//delete box
	$('.link-delete').click(function(event) {
		event.preventDefault();

		// feedback to user through cursor change
		$('body').css('cursor', 'wait');

		var backup_id = this.href.match(/ID=([0-9]+)/)[1];
		var request_url = "<?php echo html_entity_decode(BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=delete_confirm'.AMP.'ID='); ?>" + backup_id;

		// get download page
		$.get(request_url, function( data ) {

			// feedback to user through cursor change
			$('body').css('cursor', 'default');


			var modal_box = $('<div />').dialog({
				autoOpen:false,
				modal:true,
				title:'Delete',
				width:500
			});
			// load modal box
			modal_box.html(data);
			modal_box.dialog( "open" );
		});
	});	
	
	$('.toggle-note').hover(
		function() { $(this).find('a[class!="add-note"]').show(); },
		function() { $(this).find('a[class!="add-note"]').hide(); }
	);

	$('.toggle-note div').toggle(
		function() { $(this).css({ 'line-height':'1.5em', 'white-space':'normal', 'overflow':'show' }); },
		function() { $(this).css({ 'line-height':'1em', 'white-space':'pre', 'overflow':'hidden' }); }
	);

	$('.toggle-note a').click(function() {
		$(this).parent().hide().parent().find('.form-note').show();
		return false;
	});

	$('.form-note .buttons a').click(function() {
		$(this).parent().parent().parent().parent().hide().parent().find('.toggle-note').show();
		return false;
	});
});
</script>

<style type="text/css">
.ui-dialog { position:absolute; }
.ui-dialog-content {}
.ui-dialog-content .backup { padding-top:20px; }
.ui-dialog-content .backup h3 { padding:0px 0px 10px; }
.ui-dialog-content .backup p {}
.ui-dialog-content .backup ul { margin:0; padding:10px 0px 0px; overflow:hidden; zoom:1.0; }
.ui-dialog-content .backup ul li { float:left; }
.ui-dialog-content .backup ul li span { float:none; display:block; }
.ui-dialog-content .backup ul li span a {}

.toggle-note { position:relative; overflow:hidden; zoom:1.0; }
.toggle-note div { float:left; width:200px; line-height:1em; overflow:hidden; text-overflow:ellipsis; white-space:pre; cursor:pointer; }
.toggle-note a { display:none; position:absolute; top:0px; right:0px; }
.toggle-note a.add-note { display:block; position:relative; }
.form-note { display:none; }
.textfield { padding-bottom:7px; }
.buttons { overflow:hidden; zoom:1.0; }
.buttons a,
.buttons input { color:#fff !important; }
.buttons a:hover { text-decoration:none; }
</style>

<?php
$this->table->clear();

$this->table->set_template($cp_table_template);
$this->table->set_heading(array(
	lang('backup_date'),
	lang('time_to_backup'),
	lang('backup_status'),
	lang('backup_size'),
	lang('backup_note'),
	lang('actions'),
));

foreach( $backups as $backup )
{

	// format start time
	$backup['start_time'] = date('F j, Y g:ia', $class->EE->localize->set_localized_time($backup['start_time']));

	// format backup duration
	$hrs = (int)date('G', $backup['backup_time']);
	$min = (int)date('i', $backup['backup_time']);
	$sec = (int)date('s', $backup['backup_time']);

	$backup['backup_time']	= (empty($sec) ? '' : $sec.' second'.($sec > 1 ? 's ' : ' '));

	if( !empty($hrs) OR !empty($min) )
	{
		$backup['backup_time']	= (empty($hrs) ? '' : $hrs.' hour'.($hrs > 1 ? 's ' : ' '));
		$backup['backup_time'] .= (empty($min) ? '' : $min.' minute'.($min > 1 ? 's ' : ' '));
	}

	// format backup size
	$backup['backup_size'] = byte_format(round($backup['backup_size']*(1024*1024*1024)));

	// build note view and form
	$note_html  = '';

	if( empty($backup['note']) )
	{
		$note_html .= '<div class="toggle-note"><a class="add-note" href="#">'.lang('backup_add_note').'</a></div>';
	}
	else
	{
		$note_html .= '<div class="toggle-note"><div>'.$backup['note'].'</div><a href="#">'.lang('backup_edit').'</a></div>';
	}
	$note_html .= '<div class="form-note">';
	$note_html .= form_open('C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=note'.AMP.'ID='.$backup['backup_id']);
	$note_html .= '<div class="textfield">'.form_input('note', $backup['note']).'</div>';
	$note_html .= '<div class="buttons"><span class="button">'.form_submit(array('name'=>'submit', 'value'=>lang('backup_save_note'), 'class'=>'submit')).'</span><span class="button"><a class="submit" href="#">'.lang('backup_cancel').'</a></span></div>';
	$note_html .= form_close();
	$note_html .= '</div>';
	$backup['note'] = $note_html;

	if( $backup['status'] != 'Unk Error')
	{
		if( $backup['status'] == 'archived' || $backup['status'] == 'current_full' )
		{
			$backup['actions'][] = '<a href="'.BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=retrieve'.AMP.'ID='.$backup['backup_id'].'" class="link-download">'.lang('download').'</a>';
			$backup['actions'][] = '<a href="'.BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=search'.AMP.'O='.$backup['backup_id'].'">'.lang('search').'</a>';
			$backup['actions'][] = '<a href="'.BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=delete_confirm'.AMP.'ID='.$backup['backup_id'].'" class="link-delete">'.lang('delete').'</a>';
		}
		else
		{
			$backup['actions'][]= '';
		}

	}
	$backup['actions'] = implode(' | ', $backup['actions']);

	$this->table->add_row(array(
		$backup['start_time'],
		$backup['backup_time'],
		$backup['backup_type'],
		$backup['backup_size'],
		$backup['note'],
		$backup['actions'],
	));
}

echo $this->table->generate();
?>

<?php if( !$this->input->get('all') ) : ?>
	<p><a href="<?php echo BASE.AMP.'C=addons_modules'.AMP.'M=show_module_cp'.AMP.'module=safeharbor'.AMP.'method=index'.AMP.'all=1'; ?>">View All</a></p>
<?php endif; ?>

<div id="dialog"></div>
