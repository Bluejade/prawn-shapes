$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),
                             '..', 'lib'))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),
                             '..', 'vendor', 'prawn-core', 'lib'))

require 'prawn/core'
Prawn.debug = true
