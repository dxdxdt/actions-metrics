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
Updated: 2026-11-27T14:32:04.791465+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.726 |  |
| ap-east-1 | 0.518 |  |
| ap-east-2 | 0.473 |  |
| ap-northeast-1 | 0.381 |  |
| ap-northeast-2 | 0.457 |  |
| ap-northeast-3 | 0.400 |  |
| ap-south-1 | 0.686 |  |
| ap-south-2 | 0.691 |  |
| ap-southeast-1 | 0.579 |  |
| ap-southeast-2 | 0.508 |  |
| ap-southeast-3 | 0.623 |  |
| ap-southeast-4 | 0.560 |  |
| ap-southeast-5 | 0.598 |  |
| ap-southeast-6 | 0.533 |  |
| ap-southeast-7 | 0.660 |  |
| ca-central-1 | 0.155 | 18 |
| ca-west-1 | 0.173 |  |
| eu-central-1 | 0.384 |  |
| eu-central-2 | 0.388 |  |
| eu-north-1 | 0.417 |  |
| eu-south-1 | 0.390 |  |
| eu-south-2 | 0.384 |  |
| eu-west-1 | 0.317 |  |
| eu-west-2 | 0.347 |  |
| eu-west-3 | 0.366 |  |
| il-central-1 | 0.500 |  |
| me-central-1 | 0.651 |  |
| me-south-1 | 0.791 |  |
| me-west-1 | 0.693 |  |
| mx-central-1 | 0.169 |  |
| sa-east-1 | 0.462 |  |
| sa-west-1 | 0.476 |  |
| us-east-1 | 0.126 | 5196 |
| us-east-2 | 0.139 | 1731 |
| us-gov-east-1 | 0.128 | 1968 |
| us-gov-west-1 | 0.145 | 251 |
| us-west-1 | 0.103 | 4227 |
| us-west-2 | 0.147 | 200 |

