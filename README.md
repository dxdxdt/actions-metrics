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
Updated: 2026-03-20T12:40:35.341900+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.917 |  |
| ap-east-1 | 0.768 |  |
| ap-east-2 | 0.711 |  |
| ap-northeast-1 | 0.589 |  |
| ap-northeast-2 | 0.704 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.930 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.903 |  |
| ap-southeast-4 | 0.802 |  |
| ap-southeast-5 | 0.869 |  |
| ap-southeast-6 | 0.792 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.243 |  |
| eu-central-1 | 0.426 |  |
| eu-central-2 | 0.444 |  |
| eu-north-1 | 0.479 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.386 |  |
| eu-west-3 | 0.412 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.760 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.524 |  |
| us-east-1 | 0.081 | 4314 |
| us-east-2 | 0.075 | 1439 |
| us-gov-east-1 | 0.083 | 1591 |
| us-gov-west-1 | 0.276 | 189 |
| us-west-1 | 0.253 | 3266 |
| us-west-2 | 0.258 | 148 |

