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
Updated: 2026-03-25T07:49:32.608999+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.899 |  |
| ap-east-1 | 0.790 |  |
| ap-east-2 | 0.731 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.727 |  |
| ap-northeast-3 | 0.637 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.868 |  |
| ap-southeast-2 | 0.778 |  |
| ap-southeast-3 | 0.909 |  |
| ap-southeast-4 | 0.818 |  |
| ap-southeast-5 | 0.875 |  |
| ap-southeast-6 | 0.870 |  |
| ap-southeast-7 | 0.968 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.354 |  |
| eu-central-1 | 0.405 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.459 |  |
| eu-south-1 | 0.436 |  |
| eu-south-2 | 0.440 |  |
| eu-west-1 | 0.324 |  |
| eu-west-2 | 0.360 |  |
| eu-west-3 | 0.384 |  |
| il-central-1 | 0.576 |  |
| me-central-1 | 0.775 |  |
| me-south-1 | 0.732 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.509 |  |
| us-east-1 | 0.073 | 4356 |
| us-east-2 | 0.083 | 1451 |
| us-gov-east-1 | 0.100 | 1601 |
| us-gov-west-1 | 0.284 | 190 |
| us-west-1 | 0.241 | 3294 |
| us-west-2 | 0.290 | 151 |

