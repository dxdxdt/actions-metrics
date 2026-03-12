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
Updated: 2026-03-12T13:58:34.250373+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.859 |  |
| ap-east-1 | 0.812 |  |
| ap-east-2 | 0.751 |  |
| ap-northeast-1 | 0.637 |  |
| ap-northeast-2 | 0.748 |  |
| ap-northeast-3 | 0.658 |  |
| ap-south-1 | 0.840 |  |
| ap-south-2 | 0.906 |  |
| ap-southeast-1 | 0.892 |  |
| ap-southeast-2 | 0.827 |  |
| ap-southeast-3 | 0.947 |  |
| ap-southeast-4 | 0.845 |  |
| ap-southeast-5 | 0.909 |  |
| ap-southeast-6 | 0.853 |  |
| ap-southeast-7 | 1.002 |  |
| ca-central-1 | 0.105 | 16 |
| ca-west-1 | 0.293 |  |
| eu-central-1 | 0.368 |  |
| eu-central-2 | 0.385 |  |
| eu-north-1 | 0.430 |  |
| eu-south-1 | 0.404 |  |
| eu-south-2 | 0.404 |  |
| eu-west-1 | 0.295 |  |
| eu-west-2 | 0.331 |  |
| eu-west-3 | 0.357 |  |
| il-central-1 | 0.554 |  |
| me-central-1 | 0.740 |  |
| me-south-1 | 0.706 |  |
| mx-central-1 | 0.250 |  |
| sa-east-1 | 0.478 |  |
| us-east-1 | 0.046 | 4268 |
| us-east-2 | 0.092 | 1419 |
| us-gov-east-1 | 0.096 | 1565 |
| us-gov-west-1 | 0.318 | 180 |
| us-west-1 | 0.265 | 3214 |
| us-west-2 | 0.330 | 144 |

