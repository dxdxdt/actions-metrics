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
Updated: 2026-04-23T11:55:57.565811+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.689 |  |
| ap-east-2 | 0.618 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.606 |  |
| ap-northeast-3 | 0.528 |  |
| ap-south-1 | 0.939 |  |
| ap-south-2 | 1.006 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.665 |  |
| ap-southeast-3 | 0.832 |  |
| ap-southeast-4 | 0.704 |  |
| ap-southeast-5 | 0.775 |  |
| ap-southeast-6 | 0.742 |  |
| ap-southeast-7 | 0.867 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.516 |  |
| eu-central-2 | 0.578 |  |
| eu-north-1 | 0.586 |  |
| eu-south-1 | 0.572 |  |
| eu-south-2 | 0.558 |  |
| eu-west-1 | 0.442 |  |
| eu-west-2 | 0.495 |  |
| eu-west-3 | 0.507 |  |
| il-central-1 | 0.718 |  |
| me-central-1 | 0.875 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.203 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.170 | 4546 |
| us-east-2 | 0.172 | 1526 |
| us-gov-east-1 | 0.155 | 1662 |
| us-gov-west-1 | 0.180 | 194 |
| us-west-1 | 0.124 | 3464 |
| us-west-2 | 0.179 | 157 |

