component {

    function run( string testboxPath = "testbox" ) {
        var root = variables.fileSystemUtil.resolvePath( "." );
        variables.fileSystemUtil.createMapping( "/megaphone", root );
        variables.fileSystemUtil.createMapping( "/tests", root & "/tests" );
        variables.fileSystemUtil.createMapping( "/testbox", variables.fileSystemUtil.resolvePath( testboxPath ) );
        var result = new testbox.system.TestBox( bundles = "tests.specs.unit.SchedulerControlSpec" )
            .runRaw()
            .getMemento();
        variables.print.line( "Passed: #result.totalPass#; failed: #result.totalFail#; errors: #result.totalError#" );
        for ( var bundle in result.bundleStats ) {
            for ( var suite in bundle.suiteStats ) {
                for ( var spec in suite.specStats ) {
                    variables.print.line( spec.status & " " & spec.name & " " & spec.failMessage );
                    if ( spec.status == "Error" ) {
                        variables.print.line( spec.error.message );
                    }
                }
            }
        }
        if ( result.totalPass != 2 || result.totalFail || result.totalError ) {
            throw( message = "Scheduler controls failed" );
        }
    }

}
