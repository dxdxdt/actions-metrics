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
Updated: 2026-04-26T19:41:11.942379+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.741 |  |
| ap-east-2 | 0.675 |  |
| ap-northeast-1 | 0.560 |  |
| ap-northeast-2 | 0.665 |  |
| ap-northeast-3 | 0.584 |  |
| ap-south-1 | 0.877 |  |
| ap-south-2 | 0.940 |  |
| ap-southeast-1 | 0.811 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.774 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.916 |  |
| ca-central-1 | 0.163 | 16 |
| ca-west-1 | 0.279 |  |
| eu-central-1 | 0.454 |  |
| eu-central-2 | 0.475 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.485 |  |
| eu-south-2 | 0.482 |  |
| eu-west-1 | 0.385 |  |
| eu-west-2 | 0.419 |  |
| eu-west-3 | 0.433 |  |
| il-central-1 | 0.624 |  |
| me-central-1 | 0.844 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.208 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.105 | 4568 |
| us-east-2 | 0.110 | 1536 |
| us-gov-east-1 | 0.104 | 1665 |
| us-gov-west-1 | 0.247 | 194 |
| us-west-1 | 0.196 | 3486 |
| us-west-2 | 0.245 | 157 |

