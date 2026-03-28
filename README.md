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
Updated: 2026-03-28T05:52:28.655747+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.002 |  |
| ap-east-1 | 0.690 |  |
| ap-east-2 | 0.634 |  |
| ap-northeast-1 | 0.515 |  |
| ap-northeast-2 | 0.624 |  |
| ap-northeast-3 | 0.539 |  |
| ap-south-1 | 0.883 |  |
| ap-south-2 | 0.892 |  |
| ap-southeast-1 | 0.764 |  |
| ap-southeast-2 | 0.682 |  |
| ap-southeast-3 | 0.819 |  |
| ap-southeast-4 | 0.735 |  |
| ap-southeast-5 | 0.783 |  |
| ap-southeast-6 | 0.750 |  |
| ap-southeast-7 | 0.872 |  |
| ca-central-1 | 0.198 | 16 |
| ca-west-1 | 0.196 |  |
| eu-central-1 | 0.518 |  |
| eu-central-2 | 0.530 |  |
| eu-north-1 | 0.573 |  |
| eu-south-1 | 0.536 |  |
| eu-south-2 | 0.576 |  |
| eu-west-1 | 0.438 |  |
| eu-west-2 | 0.474 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.694 |  |
| me-central-1 | 0.880 |  |
| me-south-1 | 0.837 |  |
| mx-central-1 | 0.255 |  |
| sa-east-1 | 0.612 |  |
| us-east-1 | 0.165 | 4373 |
| us-east-2 | 0.141 | 1459 |
| us-gov-east-1 | 0.148 | 1610 |
| us-gov-west-1 | 0.188 | 190 |
| us-west-1 | 0.150 | 3313 |
| us-west-2 | 0.184 | 152 |

