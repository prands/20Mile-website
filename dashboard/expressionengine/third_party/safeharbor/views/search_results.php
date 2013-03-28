<?php
$this->table->clear();

$this->table->set_template($cp_table_template);
$this->table->set_heading(array(
	lang('#'),
	lang('file_path'),
	lang('file'),
	lang('download'),
));

$i=1;
foreach( $results as $id => $row)
{
	$this->table->add_row(array(
		$i,
		$row['file']['path'],
		$row['file']['name'],
		$row['download_url']
	));
	$i++;
}
echo $this->table->generate();
