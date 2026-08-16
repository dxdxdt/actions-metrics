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
Updated: 2026-08-16T05:20:54.294533+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.032 |  |
| ap-east-1 | 0.634 |  |
| ap-east-2 | 0.577 |  |
| ap-northeast-1 | 0.458 |  |
| ap-northeast-2 | 0.559 |  |
| ap-northeast-3 | 0.484 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.853 |  |
| ap-southeast-1 | 0.720 |  |
| ap-southeast-2 | 0.633 |  |
| ap-southeast-3 | 0.770 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.734 |  |
| ap-southeast-6 | 0.664 |  |
| ap-southeast-7 | 0.815 |  |
| ca-central-1 | 0.286 | 18 |
| ca-west-1 | 0.184 |  |
| eu-central-1 | 0.547 |  |
| eu-central-2 | 0.575 |  |
| eu-north-1 | 0.603 |  |
| eu-south-1 | 0.588 |  |
| eu-south-2 | 0.588 |  |
| eu-west-1 | 0.477 |  |
| eu-west-2 | 0.512 |  |
| eu-west-3 | 0.535 |  |
| il-central-1 | 0.719 |  |
| me-central-1 | 0.939 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.265 |  |
| sa-east-1 | 0.674 |  |
| us-east-1 | 0.225 | 5005 |
| us-east-2 | 0.240 | 1679 |
| us-gov-east-1 | 0.237 | 1832 |
| us-gov-west-1 | 0.132 | 223 |
| us-west-1 | 0.127 | 3962 |
| us-west-2 | 0.131 | 179 |

