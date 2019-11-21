-- Grants scripts
-- RUN as user who owns the tests

DECLARE
  V_USER_SCHEMA VARCHAR2(30 CHAR) := 'test_case_schema';
  V_UTA_SCHEMA VARCHAR2(30 CHAR)  := 'app_schema';
  TYPE t_varchar2_tab is TABLE OF varchar2(4000);
  tab_package_list T_VARCHAR2_TAB;
BEGIN
  SELECT OBJECT_OWNER
    ||'.'
    ||OBJECT_NAME bulk collect
  INTO tab_package_list
  FROM TABLE(ut_runner.get_suites_info(V_USER_SCHEMA))
  WHERE item_type = 'UT_SUITE';
  FOR i IN 1..tab_package_list.count
  LOOP
    EXECUTE IMMEDIATE 'grant execute on '|| tab_package_list(i) ||'  to '||V_UTA_SCHEMA;
  END LOOP;
END;
/