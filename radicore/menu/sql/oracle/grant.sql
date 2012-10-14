REVOKE ALL ON help_text FROM PUBLIC;
REVOKE ALL ON mnu_control FROM PUBLIC;
REVOKE ALL ON mnu_menu FROM PUBLIC;
REVOKE ALL ON mnu_nav_button FROM PUBLIC;
REVOKE ALL ON mnu_pattern FROM PUBLIC;
REVOKE ALL ON mnu_role FROM PUBLIC;
REVOKE ALL ON mnu_role_task FROM PUBLIC;
REVOKE ALL ON mnu_role_taskfield FROM PUBLIC;
REVOKE ALL ON mnu_subsystem FROM PUBLIC;
REVOKE ALL ON mnu_task FROM PUBLIC;
REVOKE ALL ON mnu_task_field FROM PUBLIC;
REVOKE ALL ON mnu_todo FROM PUBLIC;
REVOKE ALL ON mnu_user FROM PUBLIC;

GRANT SELECT,INSERT,DELETE,UPDATE ON help_text TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_control TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_menu TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_nav_button TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_pattern TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_role TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_role_task TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_role_taskfield TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_subsystem TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_task TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_task_field TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_todo TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON mnu_user TO PUBLIC;

