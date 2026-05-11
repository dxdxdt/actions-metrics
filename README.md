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
Updated: 2026-05-11T06:31:12.442842+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.973 |  |
| ap-east-1 | 0.821 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.585 |  |
| ap-northeast-2 | 0.649 |  |
| ap-northeast-3 | 0.581 |  |
| ap-south-1 | 0.909 |  |
| ap-south-2 | 0.956 |  |
| ap-southeast-1 | 0.812 |  |
| ap-southeast-2 | 0.711 |  |
| ap-southeast-3 | 0.873 |  |
| ap-southeast-4 | 0.738 |  |
| ap-southeast-5 | 0.853 |  |
| ap-southeast-6 | 0.752 |  |
| ap-southeast-7 | 0.958 |  |
| ca-central-1 | 0.159 | 16 |
| ca-west-1 | 0.214 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.505 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.512 |  |
| eu-south-2 | 0.512 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.448 |  |
| eu-west-3 | 0.464 |  |
| il-central-1 | 0.664 |  |
| me-central-1 | 0.864 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.598 |  |
| us-east-1 | 0.137 | 4624 |
| us-east-2 | 0.101 | 1588 |
| us-gov-east-1 | 0.111 | 1685 |
| us-gov-west-1 | 0.217 | 195 |
| us-west-1 | 0.165 | 3549 |
| us-west-2 | 0.209 | 158 |

