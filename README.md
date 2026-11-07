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
Updated: 2026-11-07T23:29:13.041585+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.724 |  |
| ap-east-1 | 0.537 |  |
| ap-east-2 | 0.490 |  |
| ap-northeast-1 | 0.401 |  |
| ap-northeast-2 | 0.476 |  |
| ap-northeast-3 | 0.419 |  |
| ap-south-1 | 0.677 |  |
| ap-south-2 | 0.711 |  |
| ap-southeast-1 | 0.593 |  |
| ap-southeast-2 | 0.514 |  |
| ap-southeast-3 | 0.635 |  |
| ap-southeast-4 | 0.577 |  |
| ap-southeast-5 | 0.607 |  |
| ap-southeast-6 | 0.533 |  |
| ap-southeast-7 | 0.673 |  |
| ca-central-1 | 0.141 | 18 |
| ca-west-1 | 0.187 |  |
| eu-central-1 | 0.372 |  |
| eu-central-2 | 0.378 |  |
| eu-north-1 | 0.398 |  |
| eu-south-1 | 0.379 |  |
| eu-south-2 | 0.372 |  |
| eu-west-1 | 0.302 |  |
| eu-west-2 | 0.335 |  |
| eu-west-3 | 0.347 |  |
| il-central-1 | 0.489 |  |
| me-central-1 | 0.629 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.160 |  |
| sa-east-1 | 0.454 |  |
| us-east-1 | 0.113 | 5177 |
| us-east-2 | 0.108 | 1721 |
| us-gov-east-1 | 0.127 | 1959 |
| us-gov-west-1 | 0.160 | 245 |
| us-west-1 | 0.115 | 4210 |
| us-west-2 | 0.160 | 196 |

