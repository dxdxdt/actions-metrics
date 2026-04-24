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
Updated: 2026-04-24T04:50:45.258434+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.926 |  |
| ap-east-1 | 0.777 |  |
| ap-east-2 | 0.700 |  |
| ap-northeast-1 | 0.673 |  |
| ap-northeast-2 | 0.708 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.857 |  |
| ap-south-2 | 0.957 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.800 |  |
| ap-southeast-5 | 0.887 |  |
| ap-southeast-6 | 0.832 |  |
| ap-southeast-7 | 0.944 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.255 |  |
| eu-central-1 | 0.432 |  |
| eu-central-2 | 0.458 |  |
| eu-north-1 | 0.492 |  |
| eu-south-1 | 0.475 |  |
| eu-south-2 | 0.473 |  |
| eu-west-1 | 0.360 |  |
| eu-west-2 | 0.393 |  |
| eu-west-3 | 0.413 |  |
| il-central-1 | 0.606 |  |
| me-central-1 | 0.792 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.230 |  |
| sa-east-1 | 0.540 |  |
| us-east-1 | 0.086 | 4551 |
| us-east-2 | 0.092 | 1528 |
| us-gov-east-1 | 0.090 | 1662 |
| us-gov-west-1 | 0.279 | 194 |
| us-west-1 | 0.220 | 3467 |
| us-west-2 | 0.274 | 157 |

