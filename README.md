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
Updated: 2026-04-01T20:37:14.809224+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.908 |  |
| ap-east-1 | 0.783 |  |
| ap-east-2 | 0.728 |  |
| ap-northeast-1 | 0.602 |  |
| ap-northeast-2 | 0.716 |  |
| ap-northeast-3 | 0.632 |  |
| ap-south-1 | 0.845 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.861 |  |
| ap-southeast-2 | 0.776 |  |
| ap-southeast-3 | 0.919 |  |
| ap-southeast-4 | 0.813 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.821 |  |
| ap-southeast-7 | 0.966 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.407 |  |
| eu-central-2 | 0.425 |  |
| eu-north-1 | 0.464 |  |
| eu-south-1 | 0.438 |  |
| eu-south-2 | 0.444 |  |
| eu-west-1 | 0.338 |  |
| eu-west-2 | 0.374 |  |
| eu-west-3 | 0.393 |  |
| il-central-1 | 0.578 |  |
| me-central-1 | 0.790 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.071 | 4416 |
| us-east-2 | 0.085 | 1471 |
| us-gov-east-1 | 0.085 | 1619 |
| us-gov-west-1 | 0.283 | 190 |
| us-west-1 | 0.239 | 3332 |
| us-west-2 | 0.296 | 153 |

