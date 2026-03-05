<GlobalFunctions>
  <JavascriptQuery
    id="queryJS"
    notificationDuration={4.5}
    query={include("./lib/queryJS.js", "string")}
    resourceName="JavascriptQuery"
    showSuccessToaster={false}
  />
  <SqlQueryUnified
    id="queryDB"
    query={include("./lib/queryDB.sql", "string")}
    resourceDisplayName="retool_db"
    resourceName="3b39cc6e-d82d-48d8-818f-5433148daed9"
    warningCodes={[]}
  />
  <RESTQuery
    id="queryREST"
    headers={'[{"key":"","value":"gfdgdfgdfg"}]'}
    query="test?"
    resourceDisplayName="httpbun.com"
    resourceName="3721d007-357f-41d7-a36a-72cf9bb2dbf6"
    resourceTypeOverride=""
  />
  <connectResource id="query1" _componentId={null} />
  <RESTQuery
    id="queryAllUsers"
    enableTransformer={true}
    resourceDisplayName="All Users"
    resourceName="f296ae1e-ce7c-4800-a988-6abffaf63f39"
    transformer="return data.data"
  />
  <RESTQuery
    id="query2"
    notificationDuration={4.5}
    resourceDisplayName="Stripe"
    resourceName="39ccf3f6-e6ae-4b55-bdc2-d4e4b6fc41a1"
    showSuccessToaster={false}
  />
</GlobalFunctions>
