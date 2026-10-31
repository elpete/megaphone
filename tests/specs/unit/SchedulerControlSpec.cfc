component extends="testbox.system.BaseSpec" {

    function run() {
        describe( "Scheduler ownership control", function() {
            it( "disables timer registration and startup storage access while preserving digest definitions", function() {
                var settings = { schedulerEnabled: false, digests: { daily: { schedule: "everyDayAt 09:00" } } };
                var scheduler = new tests.resources.SchedulerControlProbe( settings );
                scheduler.configure();
                scheduler.onStartup();
                expect( scheduler.tasks ).toBe( 0 );
                expect( scheduler.resolutions ).toBe( 0 );
                expect( settings.digests ).toHaveKey( "daily" );
            } );
            it( "preserves the existing enabled default and explicitly enabled scheduling", function() {
                for ( var settings in [ { digests: { daily: {} } }, { schedulerEnabled: true, digests: { daily: {} } } ] ) {
                    var scheduler = new tests.resources.SchedulerControlProbe( settings );
                    scheduler.configure();
                    scheduler.onStartup();
                    expect( scheduler.tasks ).toBe( 1 );
                    expect( scheduler.resolutions ).toBe( 1 );
                    expect( scheduler.attached ).toBe( 1 );
                    expect( scheduler.refreshes ).toBe( 1 );
                }
            } );
        } );
    }

}
