<?php


// format events for recent activity feeds
function formatEvent($event=null) {
  if($event==null)
    return null;

  // what type of event is it?
  $eventType = EventType::loadById($event->get('event_type_id'));
  $eventTypeName = $eventType->get('name');

  $formattedEvent = '';
  switch($eventTypeName) {
          
    case 'follow_user':
//      $object1 = User::loadById($event->get('user_1_id'));
//      $object2 = User::loadById($event->get('user_2_id'));    
//      $user1name = $object1->get('name');
      $user1name = $event->get('user_1_name');   
      $user2name = $event->get('user_2_name');
      $date = date("m-j-y g:i a", strtotime($event->get('date_created')));

      $formattedEvent = sprintf("%s followed %s on %s.",
        $user1name,
        $user2name,
        $date
        );
        break;
          
          
    case 'unfollow_user':
      $user1name = $event->get('user_1_name');   
      $user2name = $event->get('user_2_name');
      $date = date("m-j-y g:i a", strtotime($event->get('date_created')));

      $formattedEvent = sprintf("%s un-followed %s on %s.",
        $user1name,
        $user2name,
        $date
        );     
        break;
    
    case 'add_item':
          
        $object1 = User::loadById($event->get('user_1_id'));
        $user1name = $event->get('user_1_name');
    
  
        $product1 = $event->get('product_1_name');
          
//        $productURL = BASE_URL.'/forSale/view/'.$object2->get('id');

        $date = date("m-j-y g:i a", strtotime($event->get('date_created')));

      $formattedEvent = sprintf('%s added item %s on %s.',
        $user1name,
        $product1,
        $date
        ); 
        break;
          
          
    case 'delete_item':
        $user1name = $event->get('user_1_name');
        $title = $event->get('product_1_name');
        $date = date("m-j-y g:i a", strtotime($event->get('date_created')));

      $formattedEvent = sprintf("%s deleted item %s on %s.",
        $user1name,
        $title,
        $date
        ); 
        break;
    case 'edit_item':
      $user1name = $event->get('user_1_name');
      $item = $event->get('product_1_name');
      $data = $event->get('data_1');    
      $date = date("m-j-y g:i a", strtotime($event->get('date_created')));

      $formattedEvent = sprintf('%s edited %s for item %s</a> on %s.',
        $user1name,
        $data,
        $item,
        $date
        );
      break;

    default:
      $formattedEvent = 'Unrecognized event type.';
  }
  return $formattedEvent;
}