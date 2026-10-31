component extends="megaphone.config.Scheduler" {

    function init( required struct settings ) {
        variables.settings = arguments.settings;
        this.tasks = 0;
        this.resolutions = 0;
        this.attached = 0;
        this.refreshes = 0;
        return this;
    }
    function getModuleSettings( required name ) {
        return variables.settings;
    }
    function task( required name ) {
        this.tasks++;
        return this;
    }
    function call( required work ) {
        return this;
    }
    function everyMinute() {
        return this;
    }
    function delay( required amount, required unit ) {
        return this;
    }
    function withNoOverlaps() {
        return this;
    }
    function getInstance( required name ) {
        this.resolutions++;
        return this;
    }
    function useScheduler( required scheduler ) {
        this.attached++;
    }
    function refreshSchedules() {
        this.refreshes++;
    }

}
