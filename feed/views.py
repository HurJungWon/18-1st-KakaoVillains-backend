import json

from django.views import View
from django.http  import JsonResponse

from feed.models    import Feed, FeedImage
from account.models import User


class FeedIndexView(View):
    def get(self, request):
        feeds       = Feed.objects.all()
        feed_images = FeedImage.objects.all()

        result = []
        for feed in feeds:

            image_urls = FeedImage.objects.filter(feed_id=feed.id)
            image_url  = [element.image_url for element in image_urls]
            user       = User.objects.get(id=feed.user_id).name
            reply      = Reply.objects.filter(feed_id=feed.id).order_by('-created_at').first()
            
            my_dict = {
                'id'              : feed.id,
                'username'        : user.name,
                'title'           : feed.title,
                'content'         : feed.cotent,
                'image_url'       : image_url,
                'profile_picture' : user.profile_picture,
                'like_count'      : feed.like_count,
                'reply_count'     : feed.reply_count,
                'reply_username'  : reply.user.username,
                'reply'           : reply.content
            }

            result.append(my_dict)

        return JsonResponse({'result' : result}, status=200)

# class FeedView(View):
#     def post(self, request):
#         data        = json.loads(request.body)
#         feed        = Feed.objects.get(id=data['feed_id'])
#         feed_images = FeedImage.objects.filter(feed_id=feed.id)
#         image_url   = [element.image_url for element in feed_images]
#         replies     = feed.reply_set.all()

#         reply_list = []
#         reply_of_reply_list = []
#         for reply in replies:
#             if not reply.reply_id:
#                 reply_dict = {
#                     'id'             : reply.id,
#                     'reply'          : reply.content,
#                     'reply_username' : reply.username,
#                     'like_count'     : reply.like_count,
#                 }
#                 reply_list.append(reply_dict)
            
#             if reply.reply_id:
#                 reply_of_reply_dict = {
#                     'id'             : reply.id,
#                     'reply'          : reply.content,
#                     'reply_username' : reply.username,
#                     'like_count'     : reply.like_count,
#                     'reply_id'       : reply.reply_id
#                 }
#                 reply_of_reply_list.append(reply_of_reply_dict)
            

#         result = []

#         my_dict = {
#             'id'              : feed.id,
#             'username'        : feed.user.username,
#             'title'           : feed.title,
#             'content'         : feed.content,
#             'image_url'       : image_url,
#             'profile_picture' : feed.user.profile_picture,
#             'like_count'      : feed.like_count,
#             'reply_count'     : feed.reply_count,
#             'reply'           : reply_list,
#             'reply_of_reply'  : reply_of_reply_list

#         }
#         result.append(my_dict)

#         return JsonResponse({'result' : result}, status=200)


