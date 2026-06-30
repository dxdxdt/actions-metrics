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
Updated: 2026-06-30T20:53:15.100857+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.016 |  |
| ap-east-1 | 0.681 |  |
| ap-east-2 | 0.623 |  |
| ap-northeast-1 | 0.504 |  |
| ap-northeast-2 | 0.609 |  |
| ap-northeast-3 | 0.529 |  |
| ap-south-1 | 0.868 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.756 |  |
| ap-southeast-2 | 0.652 |  |
| ap-southeast-3 | 0.810 |  |
| ap-southeast-4 | 0.697 |  |
| ap-southeast-5 | 0.782 |  |
| ap-southeast-6 | 0.682 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.250 | 16 |
| ca-west-1 | 0.206 |  |
| eu-central-1 | 0.528 |  |
| eu-central-2 | 0.553 |  |
| eu-north-1 | 0.582 |  |
| eu-south-1 | 0.567 |  |
| eu-south-2 | 0.565 |  |
| eu-west-1 | 0.448 |  |
| eu-west-2 | 0.485 |  |
| eu-west-3 | 0.513 |  |
| il-central-1 | 0.688 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.641 |  |
| us-east-1 | 0.198 | 4805 |
| us-east-2 | 0.181 | 1648 |
| us-gov-east-1 | 0.188 | 1725 |
| us-gov-west-1 | 0.171 | 200 |
| us-west-1 | 0.122 | 3724 |
| us-west-2 | 0.164 | 163 |

