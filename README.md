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
Updated: 2026-08-03T18:44:31.246760+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.026 |  |
| ap-east-1 | 0.655 |  |
| ap-east-2 | 0.593 |  |
| ap-northeast-1 | 0.475 |  |
| ap-northeast-2 | 0.577 |  |
| ap-northeast-3 | 0.499 |  |
| ap-south-1 | 0.929 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.743 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.800 |  |
| ap-southeast-4 | 0.677 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.674 |  |
| ap-southeast-7 | 0.847 |  |
| ca-central-1 | 0.272 | 17 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.562 |  |
| eu-north-1 | 0.615 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.579 |  |
| eu-west-1 | 0.488 |  |
| eu-west-2 | 0.508 |  |
| eu-west-3 | 0.521 |  |
| il-central-1 | 0.711 |  |
| me-central-1 | 0.971 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.218 |  |
| sa-east-1 | 0.642 |  |
| us-east-1 | 0.199 | 4936 |
| us-east-2 | 0.227 | 1673 |
| us-gov-east-1 | 0.190 | 1799 |
| us-gov-west-1 | 0.172 | 209 |
| us-west-1 | 0.105 | 3879 |
| us-west-2 | 0.171 | 172 |

