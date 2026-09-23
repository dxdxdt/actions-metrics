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
Updated: 2026-09-23T21:55:51.984716+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.008 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.620 |  |
| ap-northeast-3 | 0.548 |  |
| ap-south-1 | 0.887 |  |
| ap-south-2 | 0.896 |  |
| ap-southeast-1 | 0.830 |  |
| ap-southeast-2 | 0.662 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.706 |  |
| ap-southeast-5 | 0.827 |  |
| ap-southeast-6 | 0.727 |  |
| ap-southeast-7 | 0.911 |  |
| ca-central-1 | 0.232 | 18 |
| ca-west-1 | 0.300 |  |
| eu-central-1 | 0.522 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.575 |  |
| eu-south-1 | 0.546 |  |
| eu-south-2 | 0.559 |  |
| eu-west-1 | 0.446 |  |
| eu-west-2 | 0.485 |  |
| eu-west-3 | 0.501 |  |
| il-central-1 | 0.684 |  |
| me-central-1 | 0.912 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.252 |  |
| sa-east-1 | 0.635 |  |
| us-east-1 | 0.188 | 5116 |
| us-east-2 | 0.175 | 1686 |
| us-gov-east-1 | 0.187 | 1924 |
| us-gov-west-1 | 0.197 | 235 |
| us-west-1 | 0.134 | 4136 |
| us-west-2 | 0.197 | 192 |

