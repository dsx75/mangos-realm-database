
/* Account.Active_Realm_ID --> RealmList.ID */

ALTER TABLE `account`
  MODIFY `active_realm_id` int(11) UNSIGNED COMMENT 'ID of the last played realm (or NULL if it hasn\'t been set yet).'

UPDATE `account` SET `active_realm_id` = NULL WHERE `active_realm_id` = 0;

ALTER TABLE `account`
  ADD CONSTRAINT `fk_account_realmlist` FOREIGN KEY (`active_realm_id`) REFERENCES `realmlist` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;


/* Uptime.RealmID --> RealmList.ID */

ALTER TABLE `uptime`
  ADD CONSTRAINT `fk_uptime_realmlist` FOREIGN KEY (`realmid`) REFERENCES `realmlist` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;


/* Warden_Log.Account --> Account.ID */

ALTER TABLE `warden_log`
  ADD CONSTRAINT `fk_wardenlog_account` FOREIGN KEY (`account`) REFERENCES `account` (`id`) ON UPDATE CASCADE;
