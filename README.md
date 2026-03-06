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
Updated: 2026-03-06T16:31:46.249833+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.749 |  |
| ap-east-2 | 0.683 |  |
| ap-northeast-1 | 0.564 |  |
| ap-northeast-2 | 0.676 |  |
| ap-northeast-3 | 0.591 |  |
| ap-south-1 | 0.910 |  |
| ap-south-2 | 0.966 |  |
| ap-southeast-1 | 0.821 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.772 |  |
| ap-southeast-5 | 0.846 |  |
| ap-southeast-6 | 0.768 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.147 | 16 |
| ca-west-1 | 0.245 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.472 |  |
| eu-north-1 | 0.515 |  |
| eu-south-1 | 0.481 |  |
| eu-south-2 | 0.499 |  |
| eu-west-1 | 0.385 |  |
| eu-west-2 | 0.416 |  |
| eu-west-3 | 0.437 |  |
| il-central-1 | 0.639 |  |
| me-central-1 | 0.834 |  |
| me-south-1 | 0.807 |  |
| mx-central-1 | 0.215 |  |
| sa-east-1 | 0.579 |  |
| us-east-1 | 0.120 | 4232 |
| us-east-2 | 0.102 | 1403 |
| us-gov-east-1 | 0.106 | 1532 |
| us-gov-west-1 | 0.231 | 173 |
| us-west-1 | 0.221 | 3184 |
| us-west-2 | 0.230 | 142 |

