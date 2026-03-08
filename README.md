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
Updated: 2026-03-08T01:22:20.595187+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.981 |  |
| ap-east-1 | 0.699 |  |
| ap-east-2 | 0.640 |  |
| ap-northeast-1 | 0.518 |  |
| ap-northeast-2 | 0.621 |  |
| ap-northeast-3 | 0.541 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.916 |  |
| ap-southeast-1 | 0.774 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.835 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.804 |  |
| ap-southeast-6 | 0.728 |  |
| ap-southeast-7 | 0.878 |  |
| ca-central-1 | 0.194 | 16 |
| ca-west-1 | 0.218 |  |
| eu-central-1 | 0.501 |  |
| eu-central-2 | 0.514 |  |
| eu-north-1 | 0.539 |  |
| eu-south-1 | 0.518 |  |
| eu-south-2 | 0.526 |  |
| eu-west-1 | 0.416 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.494 |  |
| il-central-1 | 0.662 |  |
| me-central-1 | 0.882 |  |
| me-south-1 | 0.832 |  |
| mx-central-1 | 0.251 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.162 | 4237 |
| us-east-2 | 0.143 | 1408 |
| us-gov-east-1 | 0.165 | 1542 |
| us-gov-west-1 | 0.196 | 174 |
| us-west-1 | 0.165 | 3192 |
| us-west-2 | 0.198 | 143 |

