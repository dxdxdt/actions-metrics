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
Updated: 2026-08-12T09:04:06.825139+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.076 |  |
| ap-east-1 | 0.619 |  |
| ap-east-2 | 0.553 |  |
| ap-northeast-1 | 0.438 |  |
| ap-northeast-2 | 0.553 |  |
| ap-northeast-3 | 0.462 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.864 |  |
| ap-southeast-1 | 0.695 |  |
| ap-southeast-2 | 0.601 |  |
| ap-southeast-3 | 0.754 |  |
| ap-southeast-4 | 0.648 |  |
| ap-southeast-5 | 0.717 |  |
| ap-southeast-6 | 0.644 |  |
| ap-southeast-7 | 0.797 |  |
| ca-central-1 | 0.323 | 18 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.574 |  |
| eu-central-2 | 0.591 |  |
| eu-north-1 | 0.651 |  |
| eu-south-1 | 0.617 |  |
| eu-south-2 | 0.619 |  |
| eu-west-1 | 0.511 |  |
| eu-west-2 | 0.557 |  |
| eu-west-3 | 0.554 |  |
| il-central-1 | 0.732 |  |
| me-central-1 | 0.979 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.222 |  |
| sa-east-1 | 0.695 |  |
| us-east-1 | 0.246 | 4976 |
| us-east-2 | 0.300 | 1679 |
| us-gov-east-1 | 0.280 | 1822 |
| us-gov-west-1 | 0.117 | 220 |
| us-west-1 | 0.086 | 3930 |
| us-west-2 | 0.117 | 176 |

