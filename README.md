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
Updated: 2026-02-26T10:38:37.999410+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.912 |  |
| ap-east-1 | 0.794 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.616 |  |
| ap-northeast-2 | 0.730 |  |
| ap-northeast-3 | 0.645 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.853 |  |
| ap-southeast-2 | 0.772 |  |
| ap-southeast-3 | 0.932 |  |
| ap-southeast-4 | 0.822 |  |
| ap-southeast-5 | 0.899 |  |
| ap-southeast-6 | 0.829 |  |
| ap-southeast-7 | 0.964 |  |
| ca-central-1 | 0.117 | 16 |
| ca-west-1 | 0.248 |  |
| eu-central-1 | 0.421 |  |
| eu-central-2 | 0.452 |  |
| eu-north-1 | 0.466 |  |
| eu-south-1 | 0.445 |  |
| eu-south-2 | 0.463 |  |
| eu-west-1 | 0.348 |  |
| eu-west-2 | 0.376 |  |
| eu-west-3 | 0.407 |  |
| il-central-1 | 0.594 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.768 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.523 |  |
| us-east-1 | 0.077 | 4186 |
| us-east-2 | 0.093 | 1380 |
| us-gov-east-1 | 0.089 | 1512 |
| us-gov-west-1 | 0.284 | 162 |
| us-west-1 | 0.251 | 3122 |
| us-west-2 | 0.286 | 132 |

