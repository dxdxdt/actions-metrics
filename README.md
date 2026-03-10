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
Updated: 2026-03-10T05:40:49.710413+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.724 |  |
| ap-northeast-1 | 0.607 |  |
| ap-northeast-2 | 0.717 |  |
| ap-northeast-3 | 0.638 |  |
| ap-south-1 | 0.872 |  |
| ap-south-2 | 0.919 |  |
| ap-southeast-1 | 0.849 |  |
| ap-southeast-2 | 0.789 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.828 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.857 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.110 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.412 |  |
| eu-central-2 | 0.431 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.431 |  |
| eu-south-2 | 0.451 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.364 |  |
| eu-west-3 | 0.395 |  |
| il-central-1 | 0.577 |  |
| me-central-1 | 0.795 |  |
| me-south-1 | 0.764 |  |
| mx-central-1 | 0.256 |  |
| sa-east-1 | 0.512 |  |
| us-east-1 | 0.070 | 4252 |
| us-east-2 | 0.088 | 1413 |
| us-gov-east-1 | 0.085 | 1550 |
| us-gov-west-1 | 0.279 | 176 |
| us-west-1 | 0.258 | 3205 |
| us-west-2 | 0.280 | 144 |

