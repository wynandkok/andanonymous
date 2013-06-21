<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcework extends SectionDatasource {

		public $dsParamROOTELEMENT = 'work';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		

		public $dsParamINCLUDEDELEMENTS = array(
				'project-name',
				'project-description',
				'project-video-embed-link',
				'project-role',
				'project-preview-image',
				'project-featured-still',
				'project-collaborators: collaborator-name',
				'project-collaborators: collaborator-link',
				'project-collaborators: collaborator-image',
				'project-stills-library-sub: project-still-resource',
				'project-stills-library-sub: project-still-name'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'Work',
				'author' => array(
					'name' => 'Wynand Kok',
					'website' => 'http://andanonymous.com',
					'email' => 'wynand.kok@live.com'),
				'version' => 'Symphony 2.3.2',
				'release-date' => '2013-06-11T10:03:00+00:00'
			);
		}

		public function getSource() {
			return '3';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
