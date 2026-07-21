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
Updated: 2026-07-21T05:14:30.472121+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.024 |  |
| ap-east-1 | 0.648 |  |
| ap-east-2 | 0.586 |  |
| ap-northeast-1 | 0.467 |  |
| ap-northeast-2 | 0.573 |  |
| ap-northeast-3 | 0.494 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.863 |  |
| ap-southeast-1 | 0.722 |  |
| ap-southeast-2 | 0.651 |  |
| ap-southeast-3 | 0.777 |  |
| ap-southeast-4 | 0.694 |  |
| ap-southeast-5 | 0.740 |  |
| ap-southeast-6 | 0.676 |  |
| ap-southeast-7 | 0.814 |  |
| ca-central-1 | 0.264 | 16 |
| ca-west-1 | 0.233 |  |
| eu-central-1 | 0.548 |  |
| eu-central-2 | 0.566 |  |
| eu-north-1 | 0.577 |  |
| eu-south-1 | 0.578 |  |
| eu-south-2 | 0.587 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.500 |  |
| eu-west-3 | 0.527 |  |
| il-central-1 | 0.706 |  |
| me-central-1 | 0.922 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.253 |  |
| sa-east-1 | 0.663 |  |
| us-east-1 | 0.218 | 4891 |
| us-east-2 | 0.226 | 1658 |
| us-gov-east-1 | 0.199 | 1771 |
| us-gov-west-1 | 0.140 | 206 |
| us-west-1 | 0.134 | 3813 |
| us-west-2 | 0.141 | 167 |

