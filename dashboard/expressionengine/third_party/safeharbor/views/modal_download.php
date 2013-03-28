
<div class="backup">
	<h3><?php echo ucfirst($selected_backup['backup_type']); ?> Backup</h3>

	<p><strong>File Name:</strong> <?php echo $selected_backup['name']; ?></p>
	<p><strong>File MD5:</strong> <?php echo $selected_backup['md5_hash']; ?></p>

	<ul class="rightNav">
		<?php foreach( $selected_backup_links as $link ) : ?>
			<li><span class="button"><?php echo $link; ?></span></li>
		<?php endforeach; ?>
		<?php if( $selected_backup['remote_available'] == '1' ) : ?>
			<?php if( !empty($selected_backup_remote_link) AND empty($full_backup) ) : ?>
				<li><span class="button"><?php echo $selected_backup_remote_link; ?></span></li>
			<?php endif; ?>
		<?php endif; ?>
	</ul>
</div>

<?php if( !empty($full_backup) ) : ?>

	<div class="backup">
		<h3><?php echo ucfirst($full_backup['backup_type']); ?> Backup</h3>

		<p><strong>File Name:</strong> <?php echo $full_backup['name']; ?></p>
		<p><strong>File MD5:</strong> <?php echo $full_backup['md5_hash']; ?></p>

		<ul class="rightNav">
			<?php foreach( $full_backup_links as $link ) : ?>
				<li><span class="button"><?php echo $link; ?></span></li>
			<?php endforeach; ?>
		</ul>
	</div>

<?php endif; ?>

<?php if( $selected_backup['remote_available'] == '1' ) : ?>
	<?php if( !empty($selected_backup_remote_link) AND !empty($full_backup) ) : ?>
		<div class="backup">
			<p>You can also download both files packaged together from your subscription plan on our servers by clicking the link below.<p>
			<ul class="rightNav">
				<li><span class="button"><?php echo $selected_backup_remote_link; ?></span></li>
			</ul>
		</div>
	<?php endif; ?>
<?php endif; ?>