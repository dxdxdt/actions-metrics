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
Updated: 2026-04-04T06:51:47.113180+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.985 |  |
| ap-east-1 | 0.715 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.650 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.863 |  |
| ap-south-2 | 0.871 |  |
| ap-southeast-1 | 0.793 |  |
| ap-southeast-2 | 0.688 |  |
| ap-southeast-3 | 0.850 |  |
| ap-southeast-4 | 0.728 |  |
| ap-southeast-5 | 0.817 |  |
| ap-southeast-6 | 0.736 |  |
| ap-southeast-7 | 0.889 |  |
| ca-central-1 | 0.213 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.519 |  |
| eu-north-1 | 0.552 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.528 |  |
| eu-west-1 | 0.418 |  |
| eu-west-2 | 0.452 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.664 |  |
| me-central-1 | 0.877 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.248 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.159 | 4430 |
| us-east-2 | 0.166 | 1477 |
| us-gov-east-1 | 0.165 | 1625 |
| us-gov-west-1 | 0.204 | 191 |
| us-west-1 | 0.150 | 3350 |
| us-west-2 | 0.204 | 153 |

