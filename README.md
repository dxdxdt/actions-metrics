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
Updated: 2026-11-04T20:10:47.437650+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.700 |  |
| ap-east-1 | 0.567 |  |
| ap-east-2 | 0.512 |  |
| ap-northeast-1 | 0.415 |  |
| ap-northeast-2 | 0.500 |  |
| ap-northeast-3 | 0.441 |  |
| ap-south-1 | 0.593 |  |
| ap-south-2 | 0.619 |  |
| ap-southeast-1 | 0.632 |  |
| ap-southeast-2 | 0.586 |  |
| ap-southeast-3 | 0.665 |  |
| ap-southeast-4 | 0.617 |  |
| ap-southeast-5 | 0.634 |  |
| ap-southeast-6 | 0.633 |  |
| ap-southeast-7 | 0.706 |  |
| ca-central-1 | 0.085 | 18 |
| ca-west-1 | 0.150 |  |
| eu-central-1 | 0.314 |  |
| eu-central-2 | 0.314 |  |
| eu-north-1 | 0.367 |  |
| eu-south-1 | 0.341 |  |
| eu-south-2 | 0.326 |  |
| eu-west-1 | 0.243 |  |
| eu-west-2 | 0.272 |  |
| eu-west-3 | 0.292 |  |
| il-central-1 | 0.436 |  |
| me-central-1 | 0.623 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.179 |  |
| sa-east-1 | 0.383 |  |
| us-east-1 | 0.049 | 5171 |
| us-east-2 | 0.070 | 1721 |
| us-gov-east-1 | 0.076 | 1959 |
| us-gov-west-1 | 0.163 | 244 |
| us-west-1 | 0.162 | 4206 |
| us-west-2 | 0.153 | 195 |

