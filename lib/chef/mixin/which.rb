#--
# Author:: Lamont Granquist <lamont@chef.io>
# Copyright:: Copyright (c) Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "chef-utils/dsl/which" unless defined?(ChefUtils::DSL::Which)
require "chef-utils/dsl/path_sanity" unless defined?(ChefUtils::DSL::PathSanity)
require "chef/mixin/chef_utils_wiring" unless defined?(Chef::Mixin::ChefUtilsWiring)

class Chef
  module Mixin
    module Which
      include ChefUtils::DSL::Which
      include ChefUtils::DSL::PathSanity
      include ChefUtilsWiring

      private

      # we dep-inject path sanity into this API for historical reasons
      #
      # @api private
      def __extra_path
        __sane_paths
      end
    end
  end
end
