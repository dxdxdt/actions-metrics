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
Updated: 2026-03-25T19:41:15.297356+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.966 |  |
| ap-east-1 | 0.728 |  |
| ap-east-2 | 0.665 |  |
| ap-northeast-1 | 0.548 |  |
| ap-northeast-2 | 0.654 |  |
| ap-northeast-3 | 0.573 |  |
| ap-south-1 | 0.901 |  |
| ap-south-2 | 0.921 |  |
| ap-southeast-1 | 0.802 |  |
| ap-southeast-2 | 0.720 |  |
| ap-southeast-3 | 0.857 |  |
| ap-southeast-4 | 0.756 |  |
| ap-southeast-5 | 0.821 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.907 |  |
| ca-central-1 | 0.147 | 16 |
| ca-west-1 | 0.235 |  |
| eu-central-1 | 0.479 |  |
| eu-central-2 | 0.489 |  |
| eu-north-1 | 0.529 |  |
| eu-south-1 | 0.502 |  |
| eu-south-2 | 0.510 |  |
| eu-west-1 | 0.410 |  |
| eu-west-2 | 0.440 |  |
| eu-west-3 | 0.452 |  |
| il-central-1 | 0.641 |  |
| me-central-1 | 0.851 |  |
| me-south-1 | 0.803 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.578 |  |
| us-east-1 | 0.117 | 4358 |
| us-east-2 | 0.113 | 1454 |
| us-gov-east-1 | 0.101 | 1604 |
| us-gov-west-1 | 0.228 | 190 |
| us-west-1 | 0.178 | 3296 |
| us-west-2 | 0.226 | 151 |

