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
Updated: 2026-04-25T16:33:54.005293+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.919 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.590 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.621 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.770 |  |
| ap-southeast-3 | 0.910 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.853 |  |
| ap-southeast-7 | 0.960 |  |
| ca-central-1 | 0.109 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.425 |  |
| eu-central-2 | 0.444 |  |
| eu-north-1 | 0.481 |  |
| eu-south-1 | 0.454 |  |
| eu-south-2 | 0.457 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.379 |  |
| eu-west-3 | 0.408 |  |
| il-central-1 | 0.579 |  |
| me-central-1 | 0.807 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.531 |  |
| us-east-1 | 0.075 | 4564 |
| us-east-2 | 0.076 | 1529 |
| us-gov-east-1 | 0.076 | 1664 |
| us-gov-west-1 | 0.290 | 194 |
| us-west-1 | 0.230 | 3477 |
| us-west-2 | 0.281 | 157 |

