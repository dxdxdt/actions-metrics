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
Updated: 2026-09-08T12:27:25.397894+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.991 |  |
| ap-east-1 | 0.712 |  |
| ap-east-2 | 0.653 |  |
| ap-northeast-1 | 0.534 |  |
| ap-northeast-2 | 0.637 |  |
| ap-northeast-3 | 0.560 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.944 |  |
| ap-southeast-1 | 0.810 |  |
| ap-southeast-2 | 0.681 |  |
| ap-southeast-3 | 0.843 |  |
| ap-southeast-4 | 0.722 |  |
| ap-southeast-5 | 0.806 |  |
| ap-southeast-6 | 0.713 |  |
| ap-southeast-7 | 0.888 |  |
| ca-central-1 | 0.200 | 18 |
| ca-west-1 | 0.207 |  |
| eu-central-1 | 0.494 |  |
| eu-central-2 | 0.509 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.526 |  |
| eu-south-2 | 0.537 |  |
| eu-west-1 | 0.420 |  |
| eu-west-2 | 0.458 |  |
| eu-west-3 | 0.474 |  |
| il-central-1 | 0.659 |  |
| me-central-1 | 0.900 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.603 |  |
| us-east-1 | 0.155 | 5091 |
| us-east-2 | 0.161 | 1685 |
| us-gov-east-1 | 0.137 | 1903 |
| us-gov-west-1 | 0.203 | 231 |
| us-west-1 | 0.143 | 4090 |
| us-west-2 | 0.200 | 192 |

