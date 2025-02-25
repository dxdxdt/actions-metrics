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
Updated: 2025-02-25T03:19:43.534397+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.752 |  |
| ap-northeast-1 | 0.552 |  |
| ap-northeast-2 | 0.664 |  |
| ap-south-1 | 0.891 |  |
| ap-southeast-1 | 0.820 |  |
| ap-southeast-2 | 0.708 |  |
| ca-central-1 | 0.140 | 4 |
| eu-central-1 | 0.482 |  |
| eu-north-1 | 0.528 |  |
| eu-south-1 | 0.499 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.436 |  |
| eu-west-3 | 0.456 |  |
| me-south-1 | 0.827 |  |
| sa-east-1 | 0.575 |  |
| us-east-1 | 0.119 | 1095 |
| us-east-2 | 0.105 | 266 |
| us-gov-east-1 | 0.101 | 276 |
| us-gov-west-1 | 0.211 | 1 |
| us-west-1 | 0.205 | 729 |
| us-west-2 | 0.208 |  |

