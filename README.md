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
Updated: 2026-10-19T05:32:29.651505+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.968 |  |
| ap-east-1 | 0.701 |  |
| ap-east-2 | 0.636 |  |
| ap-northeast-1 | 0.520 |  |
| ap-northeast-2 | 0.631 |  |
| ap-northeast-3 | 0.549 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.677 |  |
| ap-southeast-3 | 0.838 |  |
| ap-southeast-4 | 0.724 |  |
| ap-southeast-5 | 0.795 |  |
| ap-southeast-6 | 0.734 |  |
| ap-southeast-7 | 0.877 |  |
| ca-central-1 | 0.196 | 18 |
| ca-west-1 | 0.240 |  |
| eu-central-1 | 0.487 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.533 |  |
| eu-south-1 | 0.510 |  |
| eu-south-2 | 0.491 |  |
| eu-west-1 | 0.413 |  |
| eu-west-2 | 0.447 |  |
| eu-west-3 | 0.465 |  |
| il-central-1 | 0.650 |  |
| me-central-1 | 0.850 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.227 |  |
| sa-east-1 | 0.605 |  |
| us-east-1 | 0.152 | 5153 |
| us-east-2 | 0.174 | 1703 |
| us-gov-east-1 | 0.183 | 1949 |
| us-gov-west-1 | 0.209 | 239 |
| us-west-1 | 0.148 | 4176 |
| us-west-2 | 0.208 | 195 |

