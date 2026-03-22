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
Updated: 2026-03-22T22:18:49.932280+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.893 |  |
| ap-east-1 | 0.789 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.609 |  |
| ap-northeast-2 | 0.715 |  |
| ap-northeast-3 | 0.633 |  |
| ap-south-1 | 0.841 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.787 |  |
| ap-southeast-3 | 0.917 |  |
| ap-southeast-4 | 0.824 |  |
| ap-southeast-5 | 0.879 |  |
| ap-southeast-6 | 0.822 |  |
| ap-southeast-7 | 0.968 |  |
| ca-central-1 | 0.123 | 16 |
| ca-west-1 | 0.280 |  |
| eu-central-1 | 0.409 |  |
| eu-central-2 | 0.423 |  |
| eu-north-1 | 0.461 |  |
| eu-south-1 | 0.434 |  |
| eu-south-2 | 0.436 |  |
| eu-west-1 | 0.323 |  |
| eu-west-2 | 0.359 |  |
| eu-west-3 | 0.382 |  |
| il-central-1 | 0.574 |  |
| me-central-1 | 0.777 |  |
| me-south-1 | 0.746 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.507 |  |
| us-east-1 | 0.070 | 4335 |
| us-east-2 | 0.099 | 1447 |
| us-gov-east-1 | 0.102 | 1595 |
| us-gov-west-1 | 0.295 | 189 |
| us-west-1 | 0.252 | 3282 |
| us-west-2 | 0.303 | 151 |

