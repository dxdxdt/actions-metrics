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
Updated: 2026-02-20T22:18:37.432596+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.968 |  |
| ap-east-1 | 0.736 |  |
| ap-east-2 | 0.677 |  |
| ap-northeast-1 | 0.557 |  |
| ap-northeast-2 | 0.664 |  |
| ap-northeast-3 | 0.588 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.945 |  |
| ap-southeast-1 | 0.805 |  |
| ap-southeast-2 | 0.716 |  |
| ap-southeast-3 | 0.863 |  |
| ap-southeast-4 | 0.762 |  |
| ap-southeast-5 | 0.833 |  |
| ap-southeast-6 | 0.817 |  |
| ap-southeast-7 | 0.921 |  |
| ca-central-1 | 0.138 | 16 |
| ca-west-1 | 0.202 |  |
| eu-central-1 | 0.470 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.513 |  |
| eu-south-1 | 0.498 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.426 |  |
| eu-west-3 | 0.456 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.854 |  |
| me-south-1 | 0.805 |  |
| mx-central-1 | 0.223 |  |
| sa-east-1 | 0.574 |  |
| us-east-1 | 0.115 | 4155 |
| us-east-2 | 0.097 | 1359 |
| us-gov-east-1 | 0.096 | 1494 |
| us-gov-west-1 | 0.213 | 160 |
| us-west-1 | 0.225 | 3088 |
| us-west-2 | 0.214 | 129 |

