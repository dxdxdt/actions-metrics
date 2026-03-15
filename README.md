# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-03-15T06:02:02.905713+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.609 |  |
| ap-northeast-1 | 0.488 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.514 |  |
| ap-south-1 | 0.921 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.750 |  |
| ap-southeast-2 | 0.653 |  |
| ap-southeast-3 | 0.803 |  |
| ap-southeast-4 | 0.693 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.706 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.237 | 16 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.520 |  |
| eu-central-2 | 0.532 |  |
| eu-north-1 | 0.566 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.554 |  |
| eu-west-1 | 0.439 |  |
| eu-west-2 | 0.491 |  |
| eu-west-3 | 0.499 |  |
| il-central-1 | 0.713 |  |
| me-central-1 | 0.889 |  |
| me-south-1 | 0.863 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.190 | 4280 |
| us-east-2 | 0.175 | 1423 |
| us-gov-east-1 | 0.178 | 1576 |
| us-gov-west-1 | 0.172 | 185 |
| us-west-1 | 0.135 | 3234 |
| us-west-2 | 0.172 | 147 |

