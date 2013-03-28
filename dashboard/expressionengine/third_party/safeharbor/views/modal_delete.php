<div class="backup">
	<?php
	if( !empty($delete_diffs) )
	{
		echo '<p><strong>'.lang('delete_differentials').'</strong></p><br>';
	}
	?>
	
	<p><strong>File Name:</strong> <?php echo $name; ?></p>
	<p><strong>Backup Date:</strong> <?php echo $start_time; ?></p>

	<ul class="rightNav">
		<li><span class="button"><?php echo $delete_link; ?></span></li>
	</ul>
</div>
