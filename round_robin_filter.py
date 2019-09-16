from oslo_log import log as logging
from nova.scheduler import filters
LOG = logging.getLogger(__name__)
counter = 0
counter_check = 0
hypervisors = ["jerico-01", "jerico-02", "jerico-03"]

class RoundRobinFilter(filters.BaseHostFilter):
    run_filter_once_per_request = True

    def host_passes(self, host_state, spec_obj):
		global counter
		global counter_check
		global hypervisors
		counter_check += 1
		if counter_check == 4:
			counter += 1
			counter_check = 1
		LOG.debug("Counter is %d" % counter)
		LOG.debug("Host_state name %s" % host_state.host)
		if host_state.host == hypervisors[counter % 3]:
			LOG.debug("SELECTED HOST is %s" % host_state.host)
			return True
		else: return False
