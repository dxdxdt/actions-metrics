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
Updated: 2026-03-01T20:18:39.547397+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.044 |  |
| ap-east-1 | 0.643 |  |
| ap-east-2 | 0.584 |  |
| ap-northeast-1 | 0.462 |  |
| ap-northeast-2 | 0.568 |  |
| ap-northeast-3 | 0.487 |  |
| ap-south-1 | 0.936 |  |
| ap-south-2 | 0.912 |  |
| ap-southeast-1 | 0.724 |  |
| ap-southeast-2 | 0.623 |  |
| ap-southeast-3 | 0.778 |  |
| ap-southeast-4 | 0.663 |  |
| ap-southeast-5 | 0.742 |  |
| ap-southeast-6 | 0.663 |  |
| ap-southeast-7 | 0.822 |  |
| ca-central-1 | 0.287 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.544 |  |
| eu-central-2 | 0.567 |  |
| eu-north-1 | 0.597 |  |
| eu-south-1 | 0.576 |  |
| eu-south-2 | 0.587 |  |
| eu-west-1 | 0.466 |  |
| eu-west-2 | 0.515 |  |
| eu-west-3 | 0.525 |  |
| il-central-1 | 0.738 |  |
| me-central-1 | 0.938 |  |
| me-south-1 | 0.883 |  |
| mx-central-1 | 0.213 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.221 | 4207 |
| us-east-2 | 0.202 | 1387 |
| us-gov-east-1 | 0.200 | 1519 |
| us-gov-west-1 | 0.145 | 167 |
| us-west-1 | 0.105 | 3151 |
| us-west-2 | 0.146 | 136 |

