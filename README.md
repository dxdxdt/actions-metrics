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
Updated: 2026-04-08T10:01:39.639404+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.030 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.613 |  |
| ap-northeast-1 | 0.543 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.524 |  |
| ap-south-1 | 0.922 |  |
| ap-south-2 | 0.950 |  |
| ap-southeast-1 | 0.742 |  |
| ap-southeast-2 | 0.643 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.683 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.679 |  |
| ap-southeast-7 | 0.851 |  |
| ca-central-1 | 0.245 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.538 |  |
| eu-central-2 | 0.573 |  |
| eu-north-1 | 0.595 |  |
| eu-south-1 | 0.575 |  |
| eu-south-2 | 0.571 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.503 |  |
| eu-west-3 | 0.516 |  |
| il-central-1 | 0.728 |  |
| me-central-1 | 0.915 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.651 |  |
| us-east-1 | 0.205 | 4456 |
| us-east-2 | 0.177 | 1489 |
| us-gov-east-1 | 0.176 | 1634 |
| us-gov-west-1 | 0.163 | 192 |
| us-west-1 | 0.108 | 3376 |
| us-west-2 | 0.161 | 154 |

