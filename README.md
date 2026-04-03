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
Updated: 2026-04-03T17:28:23.950056+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.973 |  |
| ap-east-1 | 0.706 |  |
| ap-east-2 | 0.647 |  |
| ap-northeast-1 | 0.540 |  |
| ap-northeast-2 | 0.645 |  |
| ap-northeast-3 | 0.558 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.943 |  |
| ap-southeast-1 | 0.785 |  |
| ap-southeast-2 | 0.690 |  |
| ap-southeast-3 | 0.847 |  |
| ap-southeast-4 | 0.733 |  |
| ap-southeast-5 | 0.805 |  |
| ap-southeast-6 | 0.762 |  |
| ap-southeast-7 | 0.884 |  |
| ca-central-1 | 0.197 | 16 |
| ca-west-1 | 0.273 |  |
| eu-central-1 | 0.485 |  |
| eu-central-2 | 0.531 |  |
| eu-north-1 | 0.546 |  |
| eu-south-1 | 0.543 |  |
| eu-south-2 | 0.516 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.458 |  |
| eu-west-3 | 0.475 |  |
| il-central-1 | 0.693 |  |
| me-central-1 | 0.849 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.211 |  |
| sa-east-1 | 0.598 |  |
| us-east-1 | 0.158 | 4425 |
| us-east-2 | 0.171 | 1477 |
| us-gov-east-1 | 0.139 | 1623 |
| us-gov-west-1 | 0.213 | 191 |
| us-west-1 | 0.154 | 3347 |
| us-west-2 | 0.206 | 153 |

