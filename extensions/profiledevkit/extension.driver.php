<?php
	
	class Extension_ProfileDevKit extends Extension {
	/*-------------------------------------------------------------------------
		Definition:
	-------------------------------------------------------------------------*/
		
		public static $active = false;
		
		public function about() {
			return array(
				'name'			=> 'Profile Devkit',
				'version'		=> '1.2',
				'release-date'	=> '2013-02-22',
				'author'		=> array(
					array(
						'name' => 'Symphony Team',
						'website' => 'http://symphony-cms.com/',
						'email' => 'team@symphony-cms.com'
					),
					array(
						'name' => 'Rowan Lewis',
						'website' => 'http://rowanlewis.com/',
						'email' => 'me@rowanlewis.com'
					)
				)
			);
		}
		
		public function getSubscribedDelegates() {
			return array(
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'FrontendDevKitResolve',
					'callback'	=> 'frontendDevKitResolve'
				),
				array(
					'page'		=> '/frontend/',
					'delegate'	=> 'ManipulateDevKitNavigation',
					'callback'	=> 'manipulateDevKitNavigation'
				)
			);
		}
		
		public function frontendDevKitResolve($context) {
			if (isset($_GET['profile'])) {
				require_once(EXTENSIONS . '/profiledevkit/content/content.profile.php');
				
				$context['devkit'] = new Content_ProfileDevkit();
				self::$active = true;
			}
		}
		
		public function manipulateDevKitNavigation($context) {
			$xml = $context['xml'];
			$item = $xml->createElement('item');
			$item->setAttribute('name', __('Profile'));
			$item->setAttribute('handle', 'profile');
			$item->setAttribute('active', (self::$active ? 'yes' : 'no'));
			
			$xml->documentElement->appendChild($item);
		}
	}
