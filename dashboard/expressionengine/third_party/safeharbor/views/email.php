<html>
<head>
	<title>Safe Harbor Backup Report: <?php echo $site ?></title>
</head>
<body>

<h1>Safe Harbor Backup Report</h1>

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="50">Date:</td>
		<td><?php echo $date; ?></td>
	</tr>
	<tr>
		<td width="50">Site:</td>
		<td><?php echo $site; ?></td>
	</tr>
</table>

<p>======================================================================</p>

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="150">Local Backup Status:</td>
		<td<?php if($backup_status_local == 'Completed Successfully.') : ?> style="color:green;"<?php else : ?> style="color:red;"<?php endif; ?>><strong><?php echo $backup_status_local; ?></strong></td>
	</tr>
	<tr>
		<td width="150">Remote Backup Status:</td>
		<td<?php if($backup_status_remote == 'Completed Successfully.') : ?> style="color:green;"<?php else : ?> style="color:red;"<?php endif; ?>><strong><?php echo $backup_status_remote; ?></strong></td>
	</tr>
	<tr>
		<td width="150">Amazon S3 Backup Status:</td>
		<td<?php if($backup_status_amazon_s3 == 'Completed Successfully.') : ?> style="color:green;"<?php else : ?> style="color:red;"<?php endif; ?>><strong><?php echo $backup_status_amazon_s3; ?></strong></td>
	</tr>
	<tr>
		<td width="150">FTP Backup Status:</td>
		<td<?php if($backup_status_ftp == 'Completed Successfully.') : ?> style="color:green;"<?php else : ?> style="color:red;"<?php endif; ?>><strong><?php echo $backup_status_ftp; ?></strong></td>
	</tr>
</table>

<p>======================================================================</p>

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="125">Backup File:</td>
		<td><?php echo $backup_filename; ?></td>
	</tr>
	<tr>
		<td width="125">Backup Size:</td>
		<td><?php echo $backup_size; ?></td>
	</tr>
</table>

<p></p>

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="125">Backup Type:</td>
		<td><?php echo $backup_type; ?></td>
	</tr>
	<tr>
		<td width="125">Backup Started:</td>
		<td><?php echo $backup_time_start; ?></td>
	</tr>
	<tr>
		<td width="125">Backup Completed:</td>
		<td><?php echo $backup_time_end; ?></td>
	</tr>
</table>

<p>Backup completed in <?php echo $backup_time_total ?></p>

<table border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="150">Database Backup Method:</td>
		<td><?php echo $backup_database_mode; ?></td>
	</tr>
</table>

<p>======================================================================</p>

<p>Thank you for using Safe Harbor!</p>

<p>If you have any questions or comments, feel free to send us an email at <a href="mailto:help@eeharbor.com">help@eeharbor.com</a></p>

<p><a href="http://eeharbor.com">http://eeharbor.com</a><br/>
<a href="http://twitter.com/eeharbor">http://twitter.com/eeharbor</a></p>

</body>
</html>
