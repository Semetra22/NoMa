CREATE TABLE [contactgroups] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[name_short] varchar(255)  NOT NULL,
[name] varchar(255)  NOT NULL,
[view_only] tinyint(1) DEFAULT '0' NOT NULL,
[timezone_id] int(11) DEFAULT '0' NOT NULL,
[timeframe_id] int(11) DEFAULT '0' NOT NULL
);

CREATE TABLE [contactgroups_to_contacts] (
  [contactgroup_id] int(11) NOT NULL,
  [contact_id] int(11) NOT NULL
);

CREATE TABLE [contacts] (
[id] INTEGER  NULL,
[admin] tinyint(1)  NULL,
[username] varchar(255)  NULL,
[full_name] varchar(255)  NULL,
[email] varchar(255)  NULL,
[phone] varchar(255)  NULL,
[mobile] varchar(255)  NULL,
[section] varchar(255)  NULL,
[netaddress] varchar(255)  NULL,
[password] varchar(255)  NULL,
[timeframe_id] int(11)  NULL,
[timezone_id] int(11)  NULL,
[restrict_alerts] tinyint(1)  NULL
);

CREATE TABLE [escalation_stati] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[notification_rule] int(11) DEFAULT 'NULL' NULL,
[starttime] int(11)  NOT NULL,
[counter] int(11)  NOT NULL,
[incident_id] bigint(20)  NOT NULL,
[recipients] varchar(255)  NOT NULL,
[host] varchar(255)  NOT NULL,
[host_alias] varchar(255) DEFAULT 'NULL' NULL,
[host_address] varchar(255) DEFAULT 'NULL' NULL,
[hostgroups] varchar(255)  NOT NULL,
[service] varchar(255)  NOT NULL,
[servicegroups] varchar(255)  NOT NULL,
[check_type] varchar(255) DEFAULT 'NULL' NULL,
[status] varchar(255) DEFAULT 'NULL' NULL,
[time_string] varchar(255) DEFAULT 'NULL' NULL,
[type] varchar(255) DEFAULT 'NULL' NULL,
[output] varchar(4096) DEFAULT 'NULL' NULL
);

CREATE TABLE [escalations_contacts] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[notification_id] int(11)  NOT NULL,
[on_ok] tinyint(1)  NOT NULL,
[on_warning] tinyint(1)  NOT NULL,
[on_critical] tinyint(1)  NOT NULL,
[on_unknown] tinyint(1)  NOT NULL,
[on_host_up] tinyint(1)  NOT NULL,
[on_host_unreachable] tinyint(1)  NOT NULL,
[on_host_down] tinyint(1)  NOT NULL,
[on_type_problem] tinyint(1)  NOT NULL,
[on_type_recovery] tinyint(1)  NOT NULL,
[on_type_flappingstart] tinyint(1)  NOT NULL,
[on_type_flappingstop] tinyint(1)  NOT NULL,
[on_type_flappingdisabled] tinyint(1)  NOT NULL,
[on_type_downtimestart] tinyint(1)  NOT NULL,
[on_type_downtimeend] tinyint(1)  NOT NULL,
[on_type_downtimecancelled] tinyint(1)  NOT NULL,
[on_type_acknowledgement] tinyint(1)  NOT NULL,
[on_type_custom] tinyint(1)  NOT NULL,
[notify_after_tries] varchar(255) DEFAULT '0' NOT NULL
);

CREATE TABLE [escalations_contacts_to_contactgroups] (
  [escalation_contacts_id] int(11) NOT NULL,
  [contactgroup_id] int(11) NOT NULL
);

CREATE TABLE [escalations_contacts_to_contacts] (
  [escalation_contacts_id] int(11) NOT NULL,
  [contacts_id] int(11) NOT NULL
);

CREATE TABLE [escalations_contacts_to_methods] (
  [escalation_contacts_id] int(11) NOT NULL,
  [method_id] int(11) NOT NULL
);

CREATE TABLE [holidays] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[contact_id] int(11)  NOT NULL,
[start] datetime  NOT NULL,
[end] datetime  NOT NULL
);

CREATE TABLE [notification_logs] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[timestamp] datetime  NOT NULL,
[counter] int(11)  NOT NULL,
[check_type] varchar(10)  NOT NULL,
[check_result] varchar(15)  NOT NULL,
[host] varchar(255)  NOT NULL,
[service] varchar(255)  NOT NULL,
[notification_type] varchar(255)  NOT NULL,
[method] varchar(255)  NOT NULL,
[user] varchar(255)  NOT NULL,
[result] varchar(1023)  NOT NULL,
[unique_id] bigint(20) DEFAULT 'NULL' NULL,
[incident_id] bigint(20) DEFAULT 'NULL' NULL,
[notification_rule] int(11) DEFAULT 'NULL' NULL,
[last_method] int(11) DEFAULT 'NULL' NULL
);

CREATE TABLE [notification_methods] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[method] varchar(255)  NOT NULL,
[command] varchar(255)  NOT NULL,
[contact_field] varchar(255)  NOT NULL,
[from] varchar(255)  NOT NULL,
[on_fail] int(11)  NOT NULL,
[ack_able] tinyint(1)  NOT NULL
);

CREATE TABLE [notification_stati] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[host] varchar(255)  NOT NULL,
[service] varchar(255)  NOT NULL,
[check_type] varchar(10)  NOT NULL,
[check_result] varchar(15)  NOT NULL,
[counter] int(11)  NOT NULL,
[pid] int(11) DEFAULT '0' NOT NULL
);

CREATE TABLE [notifications] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[active] tinyint(1)  NOT NULL,
[username] varchar(255)  NOT NULL,
[recipients_include] varchar(255)  NOT NULL,
[recipients_exclude] varchar(255)  NOT NULL,
[hosts_include] varchar(255)  NOT NULL,
[hosts_exclude] varchar(255)  NOT NULL,
[hostgroups_include] varchar(255)  NOT NULL,
[hostgroups_exclude] varchar(255)  NOT NULL,
[services_include] varchar(255)  NOT NULL,
[services_exclude] varchar(255)  NOT NULL,
[servicegroups_include] varchar(255)  NOT NULL,
[servicegroups_exclude] varchar(255)  NOT NULL,
[notify_after_tries] varchar(10) DEFAULT '0' NOT NULL,
[let_notifier_handle] tinyint(1)  NOT NULL,
[rollover] tinyint(1) DEFAULT '0' NULL,
[reloop_delay] int(11) DEFAULT '0' NOT NULL,
[on_ok] tinyint(1)  NOT NULL,
[on_warning] tinyint(1)  NOT NULL,
[on_unknown] tinyint(1)  NOT NULL,
[on_host_unreachable] tinyint(1)  NOT NULL,
[on_critical] tinyint(1)  NOT NULL,
[on_host_up] tinyint(1)  NOT NULL,
[on_host_down] tinyint(1)  NOT NULL,
[on_type_problem] tinyint(1)  NOT NULL,
[on_type_recovery] tinyint(1)  NOT NULL,
[on_type_flappingstart] tinyint(1)  NOT NULL,
[on_type_flappingstop] tinyint(1)  NOT NULL,
[on_type_flappingdisabled] tinyint(1)  NOT NULL,
[on_type_downtimestart] tinyint(1)  NOT NULL,
[on_type_downtimeend] tinyint(1)  NOT NULL,
[on_type_downtimecancelled] tinyint(1)  NOT NULL,
[on_type_acknowledgement] tinyint(1)  NOT NULL,
[on_type_custom] tinyint(1)  NOT NULL,
[timezone_id] int(11) DEFAULT '372' NOT NULL,
[timeframe_id] int(11) DEFAULT '0' NOT NULL
);

CREATE TABLE [notifications_to_contactgroups] (
  [notification_id] int(11) NOT NULL,
  [contactgroup_id] int(11) NOT NULL
);

CREATE TABLE [notifications_to_contacts] (
  [notification_id] int(11) NOT NULL,
  [contact_id] int(11) NOT NULL
);

CREATE TABLE [notifications_to_methods] (
  [notification_id] int(11) NOT NULL,
  [method_id] int(11) NOT NULL
);

CREATE TABLE [timeframes] (
[id] INTEGER  PRIMARY KEY AUTOINCREMENT NOT NULL,
[timeframe_name] varchar(60)  NOT NULL,
[dt_validFrom] datetime  NOT NULL,
[dt_validTo] datetime  NOT NULL,
[day_monday_all] tinyint(1) DEFAULT '1' NULL,
[day_monday_1st] tinyint(1) DEFAULT '0' NULL,
[day_monday_2nd] tinyint(1) DEFAULT '0' NULL,
[day_monday_3rd] tinyint(1) DEFAULT '0' NULL,
[day_monday_4th] tinyint(1) DEFAULT '0' NULL,
[day_monday_5th] tinyint(1) DEFAULT '0' NULL,
[day_monday_last] tinyint(1) DEFAULT '0' NULL,
[day_tuesday_all] tinyint(1) DEFAULT '1' NULL,
[day_tuesday_1st] tinyint(1) DEFAULT '0' NULL,
[day_tuesday_2nd] tinyint(1) DEFAULT '0' NULL,
[day_tuesday_3rd] tinyint(1) DEFAULT '0' NULL,
[day_tuesday_4th] tinyint(1) DEFAULT '0' NULL,
[day_tuesday_5th] tinyint(1) DEFAULT '0' NULL,
[day_tuesday_last] tinyint(1) DEFAULT '0' NULL,
[day_wednesday_all] tinyint(1) DEFAULT '1' NULL,
[day_wednesday_1st] tinyint(1) DEFAULT '0' NULL,
[day_wednesday_2nd] tinyint(1) DEFAULT '0' NULL,
[day_wednesday_3rd] tinyint(1) DEFAULT '0' NULL,
[day_wednesday_4th] tinyint(1) DEFAULT '0' NULL,
[day_wednesday_5th] tinyint(1) DEFAULT '0' NULL,
[day_wednesday_last] tinyint(1) DEFAULT '0' NULL,
[day_thursday_all] tinyint(1) DEFAULT '1' NULL,
[day_thursday_1st] tinyint(1) DEFAULT '0' NULL,
[day_thursday_2nd] tinyint(1) DEFAULT '0' NULL,
[day_thursday_3rd] tinyint(1) DEFAULT '0' NULL,
[day_thursday_4th] tinyint(1) DEFAULT '0' NULL,
[day_thursday_5th] tinyint(1) DEFAULT '0' NULL,
[day_thursday_last] tinyint(1) DEFAULT '0' NULL,
[day_friday_all] tinyint(1) DEFAULT '1' NULL,
[day_friday_1st] tinyint(1) DEFAULT '0' NULL,
[day_friday_2nd] tinyint(1) DEFAULT '0' NULL,
[day_friday_3rd] tinyint(1) DEFAULT '0' NULL,
[day_friday_4th] tinyint(1) DEFAULT '0' NULL,
[day_friday_5th] tinyint(1) DEFAULT '0' NULL,
[day_friday_last] tinyint(1) DEFAULT '0' NULL,
[day_saturday_all] tinyint(1) DEFAULT '1' NULL,
[day_saturday_1st] tinyint(1) DEFAULT '0' NULL,
[day_saturday_2nd] tinyint(1) DEFAULT '0' NULL,
[day_saturday_3rd] tinyint(1) DEFAULT '0' NULL,
[day_saturday_4th] tinyint(1) DEFAULT '0' NULL,
[day_saturday_5th] tinyint(1) DEFAULT '0' NULL,
[day_saturday_last] tinyint(1) DEFAULT '0' NULL,
[day_sunday_all] tinyint(1) DEFAULT '1' NULL,
[day_sunday_1st] tinyint(1) DEFAULT '0' NULL,
[day_sunday_2nd] tinyint(1) DEFAULT '0' NULL,
[day_sunday_3rd] tinyint(1) DEFAULT '0' NULL,
[day_sunday_4th] tinyint(1) DEFAULT '0' NULL,
[day_sunday_5th] tinyint(1) DEFAULT '0' NULL,
[day_sunday_last] tinyint(1) DEFAULT '0' NULL,
[time_monday_start] time DEFAULT 'NULL' NULL,
[time_monday_stop] time DEFAULT 'NULL' NULL,
[time_monday_invert] tinyint(1) DEFAULT '0' NULL,
[time_tuesday_start] time DEFAULT 'NULL' NULL,
[time_tuesday_stop] time DEFAULT 'NULL' NULL,
[time_tuesday_invert] tinyint(1) DEFAULT '0' NULL,
[time_wednesday_start] time DEFAULT 'NULL' NULL,
[time_wednesday_stop] time DEFAULT 'NULL' NULL,
[time_wednesday_invert] tinyint(1) DEFAULT '0' NULL,
[time_thursday_start] time DEFAULT 'NULL' NULL,
[time_thursday_stop] time DEFAULT 'NULL' NULL,
[time_thursday_invert] tinyint(1) DEFAULT '0' NULL,
[time_friday_start] time DEFAULT 'NULL' NULL,
[time_friday_stop] time DEFAULT 'NULL' NULL,
[time_friday_invert] tinyint(1) DEFAULT '0' NULL,
[time_saturday_start] time DEFAULT 'NULL' NULL,
[time_saturday_stop] time DEFAULT 'NULL' NULL,
[time_saturday_invert] tinyint(1) DEFAULT '0' NULL,
[time_sunday_start] time DEFAULT 'NULL' NULL,
[time_sunday_stop] time DEFAULT 'NULL' NULL,
[time_sunday_invert] tinyint(1) DEFAULT '0' NULL
);

CREATE TABLE [timezones] (
  [id] int(11) NOT NULL,
  [timezone] varchar(255) NOT NULL,
  [time_diff] tinyint(11) NOT NULL
);

CREATE TABLE [tmp_active] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[notify_id] bigint(20)  NOT NULL,
[command_id] int(11) DEFAULT 'NULL' NULL,
[dest] varchar(255) DEFAULT 'NULL' NULL,
[from_user] varchar(255) DEFAULT 'NULL' NULL,
[time_string] varchar(255) DEFAULT 'NULL' NULL,
[user] varchar(255) DEFAULT 'NULL' NULL,
[method] varchar(255) DEFAULT 'NULL' NULL,
[notify_cmd] varchar(255) DEFAULT 'NULL' NULL,
[retries] int(11) DEFAULT '0' NULL,
[rule] int(11) DEFAULT '0' NULL,
[progress] tinyint(1) DEFAULT '0' NULL,
[esc_flag] tinyint(1) DEFAULT '0' NULL,
[bundled] bigint(20) DEFAULT '0' NULL,
[stime] int(11) DEFAULT '0' NULL
);

CREATE TABLE [tmp_commands] (
[id] INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
[operation] varchar(255) DEFAULT 'NULL' NULL,
[external_id] bigint(20)  NOT NULL,
[recipients] varchar(255)  NOT NULL,
[host] varchar(255) DEFAULT 'NULL' NULL,
[host_alias] varchar(255) DEFAULT 'NULL' NULL,
[host_address] varchar(255) DEFAULT 'NULL' NULL,
[hostgroups] varchar(255)  NOT NULL,
[service] varchar(255) DEFAULT 'NULL' NULL,
[servicegroups] varchar(255) DEFAULT 'NULL' NULL,
[check_type] varchar(255) DEFAULT 'NULL' NULL,
[status] varchar(255) DEFAULT 'NULL' NULL,
[stime] int(11) DEFAULT '0' NULL,
[notification_type] varchar(255) DEFAULT 'NULL' NULL,
[authors] varchar(255) DEFAULT 'NULL' NULL,
[comments] varchar(255) DEFAULT 'NULL' NULL,
[output] varchar(4096) DEFAULT 'NULL' NULL
);

CREATE INDEX [IDX_CONTACTGROUPS_TO_CONTACTS] ON [contactgroups_to_contacts] ([contactgroup_id], [contact_id]);

CREATE INDEX [IDX_NOTIFICATIONS] ON [notifications](
[id]  ASC,
[timezone_id]  ASC,
[timeframe_id]  ASC
);

CREATE INDEX [IDX_TIMEFRAMES] ON [timeframes](
[id]  ASC
);

CREATE INDEX [IDX_TIMEZONES] ON [timezones](
[id]  ASC
);

CREATE INDEX [IDX_TMP_ACTIVE] ON [tmp_active](
[id]  ASC,
[notify_id]  ASC,
[command_id]  ASC
);

CREATE INDEX [IDX_TMP_COMMANDS] ON [tmp_commands](
[id]  ASC,
[external_id]  ASC
);
