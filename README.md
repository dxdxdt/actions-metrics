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
Updated: 2026-09-13T23:55:12.719856+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.916 |  |
| ap-east-1 | 0.757 |  |
| ap-east-2 | 0.693 |  |
| ap-northeast-1 | 0.576 |  |
| ap-northeast-2 | 0.685 |  |
| ap-northeast-3 | 0.602 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.931 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.732 |  |
| ap-southeast-3 | 0.889 |  |
| ap-southeast-4 | 0.776 |  |
| ap-southeast-5 | 0.852 |  |
| ap-southeast-6 | 0.769 |  |
| ap-southeast-7 | 0.931 |  |
| ca-central-1 | 0.142 | 18 |
| ca-west-1 | 0.289 |  |
| eu-central-1 | 0.424 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.477 |  |
| eu-south-1 | 0.458 |  |
| eu-south-2 | 0.468 |  |
| eu-west-1 | 0.349 |  |
| eu-west-2 | 0.384 |  |
| eu-west-3 | 0.415 |  |
| il-central-1 | 0.592 |  |
| me-central-1 | 0.812 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.539 |  |
| us-east-1 | 0.096 | 5098 |
| us-east-2 | 0.112 | 1686 |
| us-gov-east-1 | 0.118 | 1912 |
| us-gov-west-1 | 0.263 | 233 |
| us-west-1 | 0.201 | 4109 |
| us-west-2 | 0.261 | 192 |

