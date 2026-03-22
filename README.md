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
Updated: 2026-03-22T14:21:50.095000+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.910 |  |
| ap-east-1 | 0.773 |  |
| ap-east-2 | 0.722 |  |
| ap-northeast-1 | 0.604 |  |
| ap-northeast-2 | 0.710 |  |
| ap-northeast-3 | 0.623 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.874 |  |
| ap-southeast-1 | 0.856 |  |
| ap-southeast-2 | 0.766 |  |
| ap-southeast-3 | 0.912 |  |
| ap-southeast-4 | 0.823 |  |
| ap-southeast-5 | 0.877 |  |
| ap-southeast-6 | 0.834 |  |
| ap-southeast-7 | 0.953 |  |
| ca-central-1 | 0.142 | 16 |
| ca-west-1 | 0.263 |  |
| eu-central-1 | 0.420 |  |
| eu-central-2 | 0.444 |  |
| eu-north-1 | 0.471 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.454 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.372 |  |
| eu-west-3 | 0.401 |  |
| il-central-1 | 0.588 |  |
| me-central-1 | 0.799 |  |
| me-south-1 | 0.758 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.521 |  |
| us-east-1 | 0.087 | 4330 |
| us-east-2 | 0.115 | 1446 |
| us-gov-east-1 | 0.116 | 1595 |
| us-gov-west-1 | 0.284 | 189 |
| us-west-1 | 0.235 | 3280 |
| us-west-2 | 0.289 | 151 |

